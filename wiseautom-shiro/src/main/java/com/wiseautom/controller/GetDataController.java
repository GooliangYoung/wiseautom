package com.wiseautom.controller;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import com.wiseautom.entity.File;
import com.wiseautom.entity.SysCode;
import com.wiseautom.entity.SysOss;
import com.wiseautom.enumresource.StateEnum;
import com.wiseautom.service.CommparaService;
import com.wiseautom.service.FileService;
import com.wiseautom.service.SysOssService;
import com.wiseautom.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.*;

/**
 * @author GooliangYoung
 */
@RestController
@RequestMapping("/getData")
public class GetDataController {
    @Autowired
    private CommparaService commparaService;
    @Autowired
    private FileService fileService;
    @Autowired
    private SysOssService ossService;

    /**
     * 通过枚举获取数据列表
     */
    @ResponseBody
    @RequestMapping("/getEnum")
    public R getEnum(@RequestParam Map<String, Object> params) throws Exception {
        List<EnumBean> values = new ArrayList<>();
        String enumName = (String) params.get("enumName");
        if (enumName != null && !"".equals(enumName)) {
            Class clzz = null;
            try {
                clzz = Class.forName(Constant.PACKAGE_NAME + "." + enumName);
                Method method = clzz.getMethod("values");
                EnumMessage inter[] = (EnumMessage[]) method.invoke(new Object[]{}, new Object[]{});
                for (EnumMessage enumMessage : inter) {
                    EnumBean e = new EnumBean();
                    e.setCode(enumMessage.getCode());
                    e.setValue(enumMessage.getValue());
                    values.add(e);
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return R.ok().put("data", values);
    }

    /**
     * 通过表码获取数据列表
     *
     * @param params params
     * @return r
     */
    @ResponseBody
    @RequestMapping("/getCodeValues")
    public R getCodeValues(@RequestParam Map<String, Object> params) {
        List<SysCode> sysCodeList = null;
        if (params.get("codeName") != null && !"".equals(params.get("codeName"))) {
            sysCodeList = commparaService.getCodeValues(params);
        }
        return R.ok().put("data", sysCodeList);
    }

    /**
     * oss文件上传
     *
     * @param fileName    fileName
     * @param inputStream is
     * @return str
     */
    public String uploadImage(String fileName, InputStream inputStream) {
        //获取oss
        Map<String, Object> params = new HashMap<>();
        params.put("state", StateEnum.ENABLE.getCode());
        List<SysOss> ossList = ossService.getList(params);
        if (ossList != null && ossList.size() > 0) {
            SysOss oss = ossList.get(0);
            String fileNameBak = fileName;
            String resultImgUrl = oss.getUrl();
            String endpoint = oss.getEndpoint();
            String accessKeyId = oss.getAccessKeyId();
            String accessKeySecret = oss.getAccessKeySecret();
            String bucket = oss.getBucket();
            OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
            if (!ossClient.doesBucketExist(bucket)) {
                ossClient.createBucket(bucket);
            }

            //oss属性设置
            ObjectMetadata objectMeta = new ObjectMetadata();
            // 可以在metadata中标记文件类型
            objectMeta.setContentType("image/jpeg");
            try {
                //获取上传的图片文件名, 防止文件被覆盖，以纳秒生成图片名
                Long nanoTime = System.nanoTime();
                //获取扩展名
                String extName = fileName.substring(fileName.indexOf("."));
                fileName = nanoTime + extName;
                fileName = DateUtil.getYmd() + "/" + fileName + "/" + fileNameBak;
                ossClient.putObject(bucket, fileName, inputStream, objectMeta);
                resultImgUrl += fileName;
            } catch (Exception e) {
                e.printStackTrace();
                throw new RRException("上传失败");
            } finally {
                ossClient.shutdown();
            }
            return resultImgUrl;
        }
        throw new RRException("未启用oss配置");
    }

    /**
     * layui文件上传
     */
    @ResponseBody
    @RequestMapping("/upload")
    public R upload(@RequestParam("file") MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            throw new RRException("上传文件不能为空");
        }

        if (file.getSize() > 1 * 1024 * 1024) {
            throw new RRException("图片不能大于1M");
        }
        //上传文件
        String url = uploadImage(file.getOriginalFilename(), file.getInputStream());
        return R.ok().put("url", url);
    }

    /**
     * Hupload上传文件
     */
    @ResponseBody
    @RequestMapping("/uploads")
    public R uploads(@RequestParam("uploadFile") MultipartFile[] file, HttpServletRequest request) throws Exception {

        if (file[0].isEmpty()) {
            throw new RRException("上传文件不能为空");
        }
        String fileName = file[0].getOriginalFilename();
        //获取扩展名
        String extName = fileName.substring(fileName.indexOf("."), fileName.length());
        Long size = file[0].getSize();
        if (size > 1 * 1024 * 1024) {
            throw new RRException("图片不能大于1M");
        }

        //上传文件
        String url = uploadImage(file[0].getOriginalFilename(), file[0].getInputStream());
        //存到本地文件
        //String url = "/statics/img/timg.jpg";
        String relationId = request.getParameter("relationId");
        File uploadFile = new File();
        uploadFile.setUploadId(relationId);
        uploadFile.setFileName(fileName);
        uploadFile.setFileSize(size.toString());
        uploadFile.setCreateTime(new Date());
        uploadFile.setUrl(url);
        //获取文件类型
        boolean isPicture = FileUtil.isPicture(fileName);
        if (isPicture) {
            uploadFile.setFileType("image");
        } else {
            uploadFile.setFileType(extName);
        }
        fileService.save(uploadFile);

        return R.ok().put("url", url).put("fileId", uploadFile.getId());
    }


    /**
     * Hupload文件回填
     **/
    @ResponseBody
    @RequestMapping("/getFile/{relationId}")
    public R getFile(@PathVariable("relationId") String relationId) {
        List<File> list = fileService.getByRelationId(relationId);
        return R.ok().put("fileList", list);
    }

    /**
     * Hupload删除上传文件
     */
    @ResponseBody
    @RequestMapping("/deleteFile/{fileId}")
    public R uploadFile(@PathVariable("fileId") String fileId) {
        fileService.delete(fileId);
        return R.ok();
    }

    /**
     * Hupload删除文件
     */
    @ResponseBody
    @RequestMapping("/deleteByRelationId/{relationId}")
    public R deleteByRelationId(@PathVariable("relationId") String relationId) {
        fileService.deleteByRelationId(relationId);
        return R.ok();
    }
}
