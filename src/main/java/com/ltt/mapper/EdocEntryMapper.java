package com.ltt.mapper;

import com.ltt.model.EdocEntry;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("EdocEntryMapper")
public interface EdocEntryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(EdocEntry EdocEntry);

    int insertSelective(EdocEntry record);

    EdocEntry selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(EdocEntry EdocEntry);

    int updateByPrimaryKey(EdocEntry EdocEntry);

    List<EdocEntry> findAllEntry();

    List<EdocEntry> CategoryIdByEntry(@Param("CategoryId") String CategoryId);
}