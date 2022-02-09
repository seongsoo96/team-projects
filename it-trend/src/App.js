// import Button from "./Button";
// import Button from "@mui/material/Button";
import Header from "./Header";
import { Grid } from "@mui/material";
import "./App.css";

function App() {
	return (
		<Grid container direction="column">
			<Grid item>
				<Header />
			</Grid>
			<Grid item container>
				<Grid item xs={0} sm={2}></Grid>
				<Grid item xs={12} sm={8}>
					content
				</Grid>
				<Grid item xs={0} sm={2}></Grid>
			</Grid>
		</Grid>
		// <>
		// 	<div className="App">
		// 		<h1>IT-TREND</h1>
		// 		<div>
		// 			<Button varient="contained" href="#">
		// 				로그인
		// 			</Button>
		// 		</div>
		//     <div>
		//       <Button></Button>
		//     </div>
		// 	</div>
		// </>
	);
}

export default App;
