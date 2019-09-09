package cn.hyb.mapper;

import cn.hyb.pojo.XbRole;
import cn.hyb.pojo.XbRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbRoleMapper {
    int countByExample(XbRoleExample example);

    int deleteByExample(XbRoleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbRole record);

    int insertSelective(XbRole record);

    List<XbRole> selectByExample(XbRoleExample example);

    XbRole selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbRole record, @Param("example") XbRoleExample example);

    int updateByExample(@Param("record") XbRole record, @Param("example") XbRoleExample example);

    int updateByPrimaryKeySelective(XbRole record);

    int updateByPrimaryKey(XbRole record);
}