--Chef's anti-bhop
--Module of chefs-utilities
--Made by OverlordAkise

hook.Add( "OnPlayerHitGround", "chef_slowhop", function(ply, inWater, onFloater, speed)
	local vel = ply:GetVelocity()
	if chef.bhoplimit == 0 or ( vel.x > chef.bhoplimit or vel.x < -chef.bhoplimit or vel.y > chef.bhoplimit or vel.y < -chef.bhoplimit ) then
		local doSlow = 1 + (chef.bhopslow / 100)
		ply:SetVelocity( Vector( -( vel.x / doSlow ), -( vel.y / doSlow ), 0 ) )
	end
end)