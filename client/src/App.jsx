import React from "react";
import { Route, Routes } from "react-router-dom";

import { CampaignDetails, Home, Profile, CreateCampaign } from "./pages";
import { Navbar, Sidebar } from "./components";

const App = () => {
  return (
    <div className="relative sm:-8 p-4 bg-[#13131a] min-h-screen flex flex-row ">
      {/* side bar component */}
      <div className="sm:flex hidden mr-10 relative">
        <Sidebar />
        hello
      </div>

      {/* navbar components */}

      <div className="flex-1 max-sm:w-full max-w-[1280px] mx-auto sm:pr-5">
        <Navbar />

        {/* routes  */}

        <Routes>
          <Route path="/" element={<Home />} />
        </Routes>
      </div>
    </div>
  );
};

export default App;
