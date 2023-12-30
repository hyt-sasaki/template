package template.app

import org.springframework.http.ResponseEntity
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
class HelloWorldController {
    @GetMapping("/hello")
    fun hello() : ResponseEntity<HelloDto> {
        return ResponseEntity.ok(HelloDto(hello="world"))
    }

    data class HelloDto(
        val hello: String,
    )
}