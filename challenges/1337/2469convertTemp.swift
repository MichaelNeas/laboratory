/// You are given a non-negative floating point number rounded to two decimal places celsius, that denotes the temperature in Celsius.
/// You should convert Celsius into Kelvin and Fahrenheit and return it as an array ans = [kelvin, fahrenheit]

class Solution {
    func convertTemperature(_ celsius: Double) -> [Double] {
        [celsius + 273.15, celsius * 1.8 + 32]
    }
}