package goodee.gdj58.online.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.IdService;

@RestController
public class IdController {
	@Autowired IdService idservice;
	
	@GetMapping("/idck")
	public String idck(@RequestParam(value="id") String id) {
		return idservice.getIdCk(id);
	}
}
