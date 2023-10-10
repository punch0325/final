package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.jdbc.SQL;

import com.example.model.City;

@Mapper
public interface CityMapper {
	
	@Select("select * from city")
	List<City> selectAll();
	
	
	
	@Select("""
			  select * 
			    from city
			   where countryCode = #{code, jdbcType=VARCHAR} 
			 """)                                                    // jdbcType=VARCHAR를 주면 null값이어도 오류 나지 않는다.
	List<City> selectAllByCode(String code);
	
	
	
	@Select("""
			  select code as "code", 
			  		  name as "name"
			    from country
			 """)
	List<Map<String, Object>> selectCountryCodes();
	
	
	
	@SelectProvider(type = SqlProvider.class, method = "searchAll")
	List<City> searchAll(String code, Long population);

	public static class SqlProvider {
		
		public static String searchAll(String code, Long population) {
			var s = new SQL(); //다이나믹쿼리문
			s.SELECT("*");
			s.FROM("city");
			if (code != null && !code.trim().equals(""))
				s.WHERE(String.format("countryCode = '%s'", code));
			if (population != null)
				s.WHERE(String.format("population >= %d", population));
			
			return s.toString();
		}
		
	}
	
}
