package vip.wylbw.Controller;

import com.alibaba.druid.support.json.JSONParser;
import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import vip.wylbw.Model.Node;
import vip.wylbw.Service.NodeService;
import vip.wylbw.dto.ResultDTO;

import java.util.List;

@Controller
public class indexController {
@Autowired
private NodeService service;
    @RequestMapping("index")
    public String index(Model model){

        List<Node> all = service.findAll();
        model.addAttribute("nodes",all);
        return "index";
    }
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String string1(@RequestParam(value = "t1")String content,
                          String title, @RequestParam(value = "nodeid",defaultValue = "-1")String id){
        Node node=new Node();
        node.setContent(content);
        node.setTitle(title);
        node.setCreatTime(System.currentTimeMillis());
        node.setUid(0);
        if (id.equals("-1"))
       service.add(node);
        else
        {
            node.setId(Integer.parseInt(id));
            service.update(node);
        }

        return "redirect:index";
    }
    @ResponseBody
    @RequestMapping(value = "select",method = RequestMethod.POST)
     public Object string1(int id){
        Node node = service.select(id);
        String string = JSON.toJSONString(node);

        return string;
    }
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(int id){
     service.delete(id);


        return "redirect:index";
    }
}
