package com.ltt.service.impl;

import com.ltt.mapper.EdocEntryMapper;
import com.ltt.model.EdocEntry;
import com.ltt.service.EdocEntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("EdocEntryService")
public class EdocEntryServiceImpl implements EdocEntryService {

    @Autowired
    private EdocEntryMapper edocEntryMapper;

    @Override
    public List<EdocEntry> findAllEntry() {

        return edocEntryMapper.findAllEntry();
    }

    @Override
    public List<EdocEntry> CategoryIdByEntry(String CategoryId) {

        return edocEntryMapper.CategoryIdByEntry(CategoryId);
    }

    @Override
    public int addEntry(EdocEntry edocEntry) {
        int row = edocEntryMapper.insert(edocEntry);
        return row;
    }

    @Override
    public EdocEntry findById(String id) {
        return edocEntryMapper.selectByPrimaryKey(Long.valueOf(id));
    }

    @Override
    public int saveOrUpdate(EdocEntry edocEntry) {
        int row = edocEntryMapper.updateByPrimaryKey(edocEntry);
        return row;
    }

    @Override
    public int deleteById(Integer id) {
        int row = edocEntryMapper.deleteByPrimaryKey(Long.valueOf(id));

        return row;
    }
}
