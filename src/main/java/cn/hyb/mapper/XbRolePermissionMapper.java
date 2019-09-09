package cn.hyb.mapper;

import cn.hyb.pojo.XbRolePermission;
import cn.hyb.pojo.XbRolePermissionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbRolePermissionMapper {
    int countByExample(XbRolePermissionExample example);

    int deleteByExample(XbRolePermissionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbRolePermission record);

    int insertSelective(XbRolePermission record);

    List<XbRolePermission> selectByExample(XbRolePermissionExample example);

    XbRolePermission selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbRolePermission record, @Param("example") XbRolePermissionExample example);

    int updateByExample(@Param("record") XbRolePermission record, @Param("example") XbRolePermissionExample example);

    int updateByPrimaryKeySelective(XbRolePermission record);

    int updateByPrimaryKey(XbRolePermission record);
}