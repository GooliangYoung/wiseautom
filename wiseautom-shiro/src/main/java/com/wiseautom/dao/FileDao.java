package com.wiseautom.dao;

import com.wiseautom.entity.File;

import java.util.List;

/**
 * 地产附件表
 *
 * @author GooliangYoung
 */
public interface FileDao extends BaseDao<File> {

    List<File> getByRelationId(String relationId);

    List<File> getFileList(String imgUUID);

    List<File> getFileListByUUID(List<String> list);

    void deleteByRelationId(String relationId);
}
