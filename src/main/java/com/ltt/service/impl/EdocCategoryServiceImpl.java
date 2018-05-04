package com.ltt.service.impl;

import com.ltt.mapper.EdocCategoryMapper;

import com.ltt.model.EdocCategory;
import com.ltt.model.EdocEntry;
import com.ltt.service.EdocCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("CategoryService")
public class EdocCategoryServiceImpl implements EdocCategoryService {

    @Autowired
    private EdocCategoryMapper edocCategoryMapper;

    @Override
    public List<EdocCategory> findAllCategory() {

        return edocCategoryMapper.findAllCategory();
    }
}
