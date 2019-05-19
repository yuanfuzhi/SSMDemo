package  com.yuanfz.controller;

import com.yuanfz.model.User;
import com.yuanfz.requestbody.requestUser;
import com.yuanfz.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller  
@RequestMapping("/user")
public class UserController {  
	private static Logger log=LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping(value="/loginByAjax",method= RequestMethod.POST)
	public requestUser test(@RequestBody requestUser requestuser) {
		requestUser user = new requestUser();
		user.setUserName(requestuser.getUserName());
		user.setUserPassword(requestuser.getUserPassword());
		return user;

	}

	@RequestMapping(value="/loginByForm",method= RequestMethod.POST)
	public String loginByForm(HttpServletRequest request,Model model) {
		requestUser user = new requestUser();
		user.setUserName(request.getParameter("username"));
		user.setUserPassword(request.getParameter("password"));
		model.addAttribute("user",user);
		return "showUser";
	}
    // /user/showUser?id=1
    @RequestMapping(value="/showUser",method=RequestMethod.GET)  
    public String toIndex(HttpServletRequest request,Model model){  
        int userId = Integer.parseInt(request.getParameter("id"));  
        System.out.println("userId:"+userId);
        User user =userService.getUserById(userId);
        log.debug(user.toString());
        model.addAttribute("user", user);  
        return "showUser";  
    }
}  