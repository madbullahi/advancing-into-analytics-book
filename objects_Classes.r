# class function to determing the class of an object

teams <-  c("PHL", "OAK", "NYJ", "SCR", "CHC")

w <-  c(10, 20, 30, 40, 50)

L <-  c(40, 60, 80, 10, 20)

df <-  data.frame(teams, w, L)
df

class(teams)
class(w)
class(L)
class(df)


# models and formulas

y ~ x1 + x2 + x3... + xn  #  formula object.

# dve into the car datase in base r

car.lm <-  lm(formula = dist ~ speed, data = cars)
car.lm

summary(car.lm)
qqnorm(residuals(car.lm))
qqline(residuals(car.lm),
       col = "red")
plothist <- hist(residuals(car.lm),
                 col = "lightblue",
                 main = "Histogram of Residuals",
                 xlab = "Residuals")
abline(v = 0, col = "red")
plothist

#normality test

shapiro.test(residuals(car.lm))  # p-value > 0.05, residuals are normally, if p-value < 0.05, residuals are not normally


# Graphs and Charts

