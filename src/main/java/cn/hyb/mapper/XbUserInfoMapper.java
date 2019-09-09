package cn.hyb.mapper;

import cn.hyb.pojo.XbUserInfo;
import cn.hyb.pojo.XbUserInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbUserInfoMapper {
    int countByExample(XbUserInfoExample example);

    int deleteByExample(XbUserInfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbUserInfo record);

    int insertSelective(XbUserInfo record);

    List<XbUserInfo> selectByExampleWithBLOBs(XbUserInfoExample example);

    List<XbUserInfo> selectByExample(XbUserInfoExample example);

    XbUserInfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbUserInfo record, @Param("example") XbUserInfoExample example);

    int updateByExampleWithBLOBs(@Param("record") XbUserInfo record, @Param("example") XbUserInfoExample example);

    int updateByExample(@Param("record") XbUserInfo record, @Param("example") XbUserInfoExample example);

    int updateByPrimaryKeySelective(XbUserInfo record);

    int updateByPrimaryKeyWithBLOBs(XbUserInfo record);

    int updateByPrimaryKey(XbUserInfo record);
}