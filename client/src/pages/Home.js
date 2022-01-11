import axios from "axios";
import { useContext, useEffect, useState } from "react";
import FilePondDemo from "../components/FilePondDemo";
import UpdateUserImage from "../components/UpdateUserImage";
import { AuthContext } from "../providers/AuthProvider";
const Home = () => {
  const auth = useContext(AuthContext);
  
  return (
    <div>
      <h1>Home!</h1>
      <code>{JSON.stringify(auth)}</code>
      <FilePondDemo />
      <hr />
      <UpdateUserImage />
    </div>
  );
};
export default Home;
