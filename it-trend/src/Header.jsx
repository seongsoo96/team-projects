import { AppBar, Toolbar, Typography } from "@mui/material";
import React from "react";

const Header = () => {
	return (
		<AppBar position="static">
			<Toolbar>
				<Typography>IT-TREND</Typography>
			</Toolbar>
		</AppBar>
	);
};

export default Header;
