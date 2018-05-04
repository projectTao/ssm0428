package com.ltt.controller;

import com.ltt.model.EdocCategory;
import com.ltt.service.EdocCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

@Controller
@RequestMapping("/category")
public class EdocCategoryController {

    @Autowired
    private EdocCategoryService edocCategoryService;

    /**
     * 查询文档分类
     * @return
     */
    @RequestMapping("/categoryAll")
    @ResponseBody
    public List<EdocCategory> getAllCategory(){
        List<EdocCategory> list = edocCategoryService.findAllCategory();

        return list;
    }
}
