package com.ltt.mapper;

import com.ltt.model.EdocCategory;
import com.ltt.model.EdocEntry;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EdocCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EdocCategory record);

    int insertSelective(EdocCategory record);

    EdocCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EdocCategory record);

    int updateByPrimaryKey(EdocCategory record);

    List<EdocCategory> findAllCategory();

}