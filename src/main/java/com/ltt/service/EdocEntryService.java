package com.ltt.service;

import com.ltt.model.EdocEntry;

import java.util.List;

public interface EdocEntryService {

    List<EdocEntry> findAllEntry();

    List<EdocEntry> CategoryIdByEntry(String CategoryId);

    int addEntry(EdocEntry edocEntry);

    EdocEntry findById(String id);

    int saveOrUpdate(EdocEntry edocEntry);

    int deleteById(Integer id);
}
