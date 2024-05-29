# This is ABM Video 5 
# Please continue writing your code the next videos (video ABM 6 and ABM 7)
# This is NOW PULL Example
# You do not have to merge it
using Pkg
Pkg.activate(".")


print("Hello Github")
using Agents
# 3 things
print("This is a chnage in the working branch")
#Agents!
@agent Person GridAgent{2} begin
    health ::Int64 # 0 susceptible, 1 infected
    illness_duration:: Int64 # how long has the agent been ill
end

function initialize(;
    susceptibility = 0.4, 
    illness_duration = 10
    grid_dimensions= (20,20),
    total_agents= 40)

    #Environment
    space = GridSpaceSingle((20,20); periodic=false)

    properties = Dict(
    :susceptibility=> susceptibility  # 30 % chance for infection on meeting an infected person
    :illness_duration => illness_duration
    )
    model = ABM(Person, space; properties)

    for i in 1:total_agents
        p = Person(i, (1,1), 0,0)
        add_agent_single!(p,model)
    end
    sick_person = random_agent(model)
    sick_person.health = 1
    return model
end   
# These are comments: 
#model = initialize(;susceptibility = 0.1, illness_duration = 5)
model = initialize() # without giving any input, it works because default values defined in the function
#model.susceptibility 
#p = Person(1, (1,1), 0, 0 ) 
#model[4] # access to the 4th person in the population

#Behavirol = Rules = Steps 

