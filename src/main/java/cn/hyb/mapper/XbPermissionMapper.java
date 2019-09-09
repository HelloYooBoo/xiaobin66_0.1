package cn.hyb.mapper;

import cn.hyb.pojo.XbPermission;
import cn.hyb.pojo.XbPermissionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbPermissionMapper {
    int countByExample(XbPermissionExample example);

    int deleteByExample(XbPermissionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbPermission record);

    int insertSelective(XbPermission record);

    List<XbPermission> selectByExample(XbPermissionExample example);

    XbPermission selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbPermission record, @Param("example") XbPermissionExample example);

    int updateByExample(@Param("record") XbPermission record, @Param("example") XbPermissionExample example);

    int updateByPrimaryKeySelective(XbPermission record);

    int updateByPrimaryKey(XbPermission record);
}