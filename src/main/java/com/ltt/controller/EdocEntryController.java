package com.ltt.controller;

import com.ltt.model.EdocEntry;
import com.ltt.service.EdocEntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/entry")
public class EdocEntryController {

    @Autowired
    private EdocEntryService edocEntryService;

    /**
     * 查询所有信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/entryAll")
    public String getAll(Model model , HttpServletRequest request){
        request.getSession().removeAttribute("CategoryId");
        request.getSession().removeAttribute("Category");
        request.getSession().removeAttribute("msg");
        List<EdocEntry> list = edocEntryService.findAllEntry();
        if (list != null){
            request.getSession().setAttribute("entry",list);
        }
        return "redirect:/pages/itemsList.jsp";
    }

    /**
     * 根据分类ID查询不同的分类文档
     * @param CategoryId
     * @return
     */
    @RequestMapping("/categoryIdByEntry/{CategoryId}")
    @ResponseBody
    public List<EdocEntry> getCategoryIdByEntry(@PathVariable("CategoryId") String CategoryId){
        List<EdocEntry> list = edocEntryService.CategoryIdByEntry(CategoryId);
        return list;
    }

    /**
     * 新增电子文档信息
     * @param edocEntry
     * @param request
     * @return
     */
    @RequestMapping("/addEntry")
    public String  addEntry(EdocEntry edocEntry,HttpServletRequest request){
        //通过搜索电子文档名称是否包含java字符串来进行分类存储。
        String title = request.getParameter("title");
        int result = title.indexOf("java");
        if (result >= 0){
            edocEntry.setCategoryId(1);
            int row = edocEntryService.addEntry(edocEntry);
            if (row > 0){
                //用来显示插入成功后，只显示插入的分类信息
                List<EdocEntry> list = edocEntryService.CategoryIdByEntry(String.valueOf(edocEntry.getCategoryId()));
                request.getSession().setAttribute("entry",list);
                request.getSession().setAttribute("Category",edocEntry.getCategoryId());
                return "itemsList";
            }
        }
        edocEntry.setCategoryId(2);
        int row = edocEntryService.addEntry(edocEntry);
        if (row > 0){
            List<EdocEntry> list = edocEntryService.CategoryIdByEntry(String.valueOf(edocEntry.getCategoryId()));
            request.getSession().setAttribute("entry",list);
            request.getSession().setAttribute("Category",edocEntry.getCategoryId());
            return "itemsList";
        }
    return "itemsList";
    }

    /**
     * 跳转到修改页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/entryEdit/{id}")
    public String entryEdit(@PathVariable("id") String id,Model model){
        EdocEntry edocEntry = edocEntryService.findById(id);
        if (edocEntry != null){
            model.addAttribute("edocEntry",edocEntry);
            return "editItem";
        }
        return "itemsList";
    }

    /**
     * 修改后保存到数据库
     * @param edocEntry
     * @param request
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(EdocEntry edocEntry,HttpServletRequest request){
        //判断分类
        String categoryId = request.getParameter("categoryId");
        //java类
        if (Integer.parseInt(categoryId) == 1){
            int row = edocEntryService.saveOrUpdate(edocEntry);
            if (row > 0){
                List<EdocEntry> list = edocEntryService.CategoryIdByEntry(String.valueOf(categoryId));
                request.getSession().setAttribute("entry",list);
                request.getSession().setAttribute("Category",edocEntry.getCategoryId());
                return "itemsList";
            }
            //mysql类
        }else if (Integer.parseInt(categoryId) == 2){
            int row = edocEntryService.saveOrUpdate(edocEntry);
            if (row > 0){
                List<EdocEntry> list = edocEntryService.CategoryIdByEntry(String.valueOf(categoryId));
                request.getSession().setAttribute("entry",list);
                request.getSession().setAttribute("Category",edocEntry.getCategoryId());
                return "itemsList";
            }
        }
        return "itemsList";
    }

    /**
     * 根据id删除，分类信息保持不变
     * @param id
     * @param request
     * @return
     */
    @RequestMapping("/deleteById/{id}")
    public String deleteById(@PathVariable("id") Integer id,HttpServletRequest request){
        //判断是否在首页
        String category= request.getParameter("category");
        if (category == null){
            EdocEntry edocEntry = edocEntryService.findById(String.valueOf(id));
            int categoryId =  edocEntry.getCategoryId();
            //java分类
            if (categoryId ==1){
                int row = edocEntryService.deleteById(id);
                if (row > 0){
                    List<EdocEntry> list = edocEntryService.CategoryIdByEntry(String.valueOf(categoryId));
                    request.getSession().setAttribute("entry",list);
                    //保证分类信息不会变
                    request.getSession().setAttribute("Category",edocEntry.getCategoryId());
                    request.getSession().setAttribute("msg","删除成功！");
                    return "itemsList";
                }
                //mysql分类
            }else if (categoryId ==2){
                int row = edocEntryService.deleteById(id);
                if (row > 0){
                    List<EdocEntry> list = edocEntryService.CategoryIdByEntry(String.valueOf(categoryId));
                    request.getSession().setAttribute("entry",list);
                    request.getSession().setAttribute("Category",edocEntry.getCategoryId());
                    request.getSession().setAttribute("msg","删除成功！");
                    return "itemsList";
                }
            }
        }
        //全部的信息
        int row = edocEntryService.deleteById(id);
        if (row > 0){
            request.getSession().setAttribute("msg","删除成功！");
            List<EdocEntry> list =  edocEntryService.findAllEntry();
            request.getSession().setAttribute("entry",list);
            return "itemsList";
        }
        return "itemsList";
    }
}
