package br.com.brunnadornelles.service;

import br.com.brunnadornelles.exceptions.OperationException;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
@Service
public class CalculatorService {

    private final List<String> operationHistoric = new ArrayList<>();

    public List<String> getOperationHistoric() {
        return operationHistoric;
    }

    public double addition(double number1, double number2) {
        double result = number1 + number2;
        String history = "Soma de: " + number1 + " + " + number2 + " = " + result;
        operationHistoric.add(history);
        return result;
    }

    public double subtraction(double number1, double number2) {
        double result = number1 - number2;
        String history = "Subtração de: " + number1 + " - " + number2 + " = " + result;
        operationHistoric.add(history);
        return result;
    }

    public double multiplication(double number1, double number2) {
        double result = number1 * number2;
        String history = "Multiplicação de: " + number1 + " * " + number2 + " = " + result;
        operationHistoric.add(history);
        return result;
    }

    public double division(double number1, double number2) throws OperationException {
        if (number2 == 0) {
            throw new OperationException("Não é possivel efetuar divisão por zero");
        }
        double result = number1 / number2;
        String history = "Divisão de: " + number1 + " / " + number2 + " = " + result;
        operationHistoric.add(history);
        return result;
    }

    public double exponentiation(double number1, double number2) {
        double result = Math.pow(number1, number2);
        String history = "Expoente de: " + number1 + " elevado a " + number2 + " = " + result;
        operationHistoric.add(history);
        return result;
    }
}