import axios from "axios";
import { toast } from "react-toastify";

//set default baseURL so when we use http request this will be add in front
//example: http.get("/users") will be http.get("http://localhost:3900/api/users") in development env
axios.defaults.baseURL = process.env.REACT_APP_API_URL;


export default {
  get: axios.get,
  delete: axios.delete,
  post: axios.post,
  put: axios.put,
};
