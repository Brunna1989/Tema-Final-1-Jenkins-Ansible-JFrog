package br.com.brunnadornelles.controller;

import br.com.brunnadornelles.exceptions.OperationException;
import br.com.brunnadornelles.service.CalculatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/calculator")
public class CalculatorController {

    @Autowired
    private CalculatorService calculatorService;

    @PostMapping("/sum/{number1}/{number2}")
    public double addition(@PathVariable double number1, @PathVariable double number2) {
        return calculatorService.addition(number1, number2);
    }

    @PostMapping("/subtraction/{number1}/{number2}")
    public double subtraction(@PathVariable double number1, @PathVariable double number2) {
        return calculatorService.subtraction(number1, number2);
    }

    @PostMapping("/multiplication/{number1}/{number2}")
    public double multiplication(@PathVariable double number1, @PathVariable double number2) {
        return calculatorService.multiplication(number1, number2);
    }

    @PostMapping("/division/{number1}/{number2}")
    public double division(@PathVariable double number1, @PathVariable double number2) throws OperationException {
        return calculatorService.division(number1, number2);
    }

    @PostMapping("/exponentiation/{number1}/{number2}")
    public double exponentiation(@PathVariable double number1, @PathVariable double number2) {
        return calculatorService.exponentiation(number1, number2);
    }

    @GetMapping("/history")
    public List<String> historyConsult() {
        return calculatorService.getOperationHistoric();
    }
}