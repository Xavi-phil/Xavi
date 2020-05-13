function [active_nodes] = linearThreshold(G,active_rounds,non_active_nodes,initial_nodes,activation_probability)

%G-Graph Data Structure
%active rounds-number of active rounds to run the diffusion process for
%initial_nodes-seeds for activation
%activation probability
threshold_vector=randn(size(G.Nodes,1),1);
active_nodes=initial_nodes;
G_duplicate=G;
for i=1:active_rounds
     individual = 1;
     while individual<=length(non_active_nodes)
    
        all_neighbours=neighbors(G_duplicate,non_active_nodes(individual));
       
        infected_neighbours = intersect(all_neighbours,active_nodes);
%         all_neighbours = setxor(all_neighbours,Acommon);
        prob_infection=length(infected_neighbours)*activation_probability;
            
            if(prob_infection>threshold_vector(non_active_nodes(individual)))
               active_nodes=[active_nodes;non_active_nodes(individual)];
                non_active_nodes(individual)=[];
            else
                individual =individual+1;   
            end
         
            
             
     end
end
end