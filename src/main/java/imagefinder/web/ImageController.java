package imagefinder.web;


import imagefinder.dao.DialogueRepository;
import imagefinder.domain.Dialogue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.security.SecureRandom;
import java.util.*;

@RestController
@RequestMapping("/image")
public class ImageController {

    @Autowired
    private DialogueRepository dialogueRepository;

    @RequestMapping("/greeting")
    public String greeting(@RequestParam(value = "name", required = false, defaultValue = "World") String name, Model model) {
        model.addAttribute("name", name);
        return "greeting";
    }

    @RequestMapping("/query")
    public ModelAndView mvc1() {
        return new ModelAndView("index");
    }

    @RequestMapping("/discovery")
    public ModelAndView imageContainer() {
        Pageable limit = new PageRequest(0, 3000);
        Page<Dialogue> resultList = dialogueRepository.findAll(limit);
        List<Dialogue> copy = new ArrayList<Dialogue>(resultList.getContent());
        Collections.shuffle(copy);
        Map<String, Object> model = new HashMap<String, Object>();
        List<Dialogue> dialogueList = copy.subList(0, 16);
        model.put("dialogueList", dialogueList);
        return new ModelAndView("imageContainer", model);
    }

    @RequestMapping("/searchImageByKeyWords")
    public ModelAndView searchImageByKeyWords(@RequestParam("keyWords") String keyWords) {
        List<Dialogue> resultList = new ArrayList<>();
        if (keyWords != null) {
            for (String k : keyWords.split(" ")) {
                resultList.addAll(dialogueRepository.findAllBySimpleTextIgnoreCaseContaining(k));
            }
        }
        Map<String, Object> model = new HashMap<String, Object>();
        if (resultList.size() > 50) {
            model.put("dialogueList", resultList.subList(0,50));
        } else {
            model.put("dialogueList", resultList);
        }
        return new ModelAndView("imageContainer", model);
    }

    @RequestMapping("/test")
    public ModelAndView test() {
        return new ModelAndView("testCanvas");
    }

}