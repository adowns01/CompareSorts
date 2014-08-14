# require_relative 'compareSort'


def lines(lam)
	puts "*"*10
	lam.call
	puts "*"*10
end 


lam = lambda { 
	puts "HI"
	return "HI" }
lines(lam)