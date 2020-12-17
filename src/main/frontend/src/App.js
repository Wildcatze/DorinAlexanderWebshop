import React, { Component } from "react";
import axios from "axios";
import { BrowserRouter as Router, Switch, Route, Link,NavLink } from "react-router-dom";
import './App.css';
import   {Button } from "react-bootstrap";
import ListingsList from "./listings/ListingsComponent";
import 'bootstrap/dist/css/bootstrap.min.css';
import ListingComponent from "./listings/ListingComponent";
import AddTutorial from"./listings/add listing";
class App extends Component {

  
render() {
  return (
       <Router>
        <div>
          <nav className="navbar navbar-expand navbar-dark bg-dark">
            {/* this will reload the whole page */}
            <a href="/listings" className="navbar-brand">
              React frontend
            </a>
            <div className="navbar-nav mr-auto">
              <li className="nav-item">
                <Link to={"/listings"} className="nav-link">
                  Tutorials
                </Link>
              </li>
              <li className="nav-item">
                <Link to={"/add"} className="nav-link">
                  Add
                </Link>
              </li>
              <li className="nav-item">
                <Link to={"/customers"} className="nav-link">
                  Customers
                </Link>
              </li>
            </div>
          
          </nav>

          {/* className="container mt-3" */}
          <div className="container-expand mt-3">
            <Switch>
              <Route
                exact
                path={["/", "/listings"]}
                component={ListingsList}
              />
              <Route exact path="/add" component={AddTutorial}/>
              <Route path="/listings/:id" component={ListingComponent} />
              <Route path="/customers"  />
              <Route exact path="/login"  />
             <Route exact path="/register" />
            </Switch>
          </div>
        </div>
    </Router>
  );
}
}
export default App;
