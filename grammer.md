# Simple grammer with precedencies
S -> E
E -> E + T
E -> E - T
E -> T
T -> T * F
T -> T / F
T -> F
F -> ( E )
F -> id
E -> H id => H
H -> hex | dec | oct

# Symbols

id 		= [0..9]+

# Regular Expression

((hex | dec | oct) [0-9]+ => (hex | dec | oct)) | [0-9]+(( + | - | * | / )[0..9]+)*