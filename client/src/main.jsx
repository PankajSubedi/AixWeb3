import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter as Router } from "react-router-dom";
import { ChainId, ThirdwebProvider } from "@thirdweb-dev/react";
import "./index.css";
import App from "./App";
//import css

const root = ReactDOM.createRoot(document.getElementById("root"));

// wrapper for entire app

root.render(
  <ThirdwebProvider desiredChainId={ChainId.Sepolia}>
    <Router>
      <App />
    </Router>
  </ThirdwebProvider>
);
