import React, { Component } from "react";
import axios from "axios";
import { BrowserRouter as Router, Switch, Route, Link,NavLink } from "react-router-dom";
import './App.css';
import   {Button } from "react-bootstrap";
import ListingsList from "./listings/ListingsComponent";
import 'bootstrap/dist/css/bootstrap.min.css';
class App extends Component {

  
render() {
  return (
    <Router>
      <div className="page-container">
        <Button href="displayListings" className="b">Hello</Button>
      </div>
      <Switch>
        <Route path="/displayListings" component={ListingsList}/>
      </Switch>
    </Router>
  );
}
}
export default App;
