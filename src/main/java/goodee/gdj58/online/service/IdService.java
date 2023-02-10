package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.IdMapper;

@Service
@Transactional
public class IdService {
	@Autowired IdMapper idMapper;
	
	// null이면 사용가능, null아니면 사용불가 아이디
	public String getIdCheck(String id) {
		return idMapper.selectIdCheck(id);
	}
	
	// 중복아이디 체크 (ajax)
	public String getIdCk(String id) {
		// 사용가능한 ID "YES", 불가 "NO"
		String resultStr = "NO";
		
		if(idMapper.selectIdCheck(id) == null) {
			resultStr = "YES";
		}
		
		return resultStr;
	}
}
