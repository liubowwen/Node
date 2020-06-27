package vip.wylbw.Mapper;

import org.apache.ibatis.annotations.Mapper;
import vip.wylbw.Model.Node;

import java.util.List;
@Mapper
public interface NodeMapper {
     List<Node> findAll();

}
