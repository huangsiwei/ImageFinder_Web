package imagefinder.web;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/")
public class IndexController {

    @RequestMapping("/")
    public ModelAndView index() {
        return new ModelAndView("redirect:/image/query");
    }

}
