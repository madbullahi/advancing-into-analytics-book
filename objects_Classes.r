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