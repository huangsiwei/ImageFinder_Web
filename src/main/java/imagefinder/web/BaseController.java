package imagefinder.web;

import com.alibaba.fastjson.JSON;
import imagefinder.dao.FriendlyLinkRepository;
import imagefinder.domain.FriendlyLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hsw11 on 2017/9/4.
 */
@RestController
@RequestMapping("/base")
public class BaseController {

    @Autowired
    private FriendlyLinkRepository friendlyLinkRepository;

    @RequestMapping("/friendlyLinks")
    public ModelAndView friendlyLink() {
        Map<String, Object> model = new HashMap<String, Object>();
        List<FriendlyLink> friendlyLinkList = friendlyLinkRepository.findAllByDeleted(false);
        model.put("friendlyLinkList", friendlyLinkList);
        return new ModelAndView("base/friendlyLinkContainer", model);
    }
}
