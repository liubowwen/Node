package vip.wylbw.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.wylbw.Mapper.NodeMapper;
import vip.wylbw.Model.Node;

import java.util.List;

@Service
public class NodeService {
     @Autowired
  private NodeMapper nodeMapper;
    public List<Node> findAll() {
        List<Node> mapperAll = nodeMapper.findAll();
//        for (Node node : mapperAll) {
//                       if (node.getContent().length()>20)
//                node.setContent("<p>"+node.getContent().substring(0,20)+"<p>");
//
//        }
        return mapperAll;
    }

    public void add(Node node) {
        nodeMapper.add(node);

    }

    public Node select(int id) {
       return nodeMapper.select(id);

    }

    public void delete(int id) {
        nodeMapper.delete(id);
    }

    public void update(Node node) {
        nodeMapper.update(node);
    }
}
