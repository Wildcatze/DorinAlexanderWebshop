import React, { Component } from "react";
import http from "../service/httpservice";
import {Link} from "react-router-dom";



export default class ListingsList extends Component {
    constructor(props) {
      super(props);
      this.onChangeSearchTitle = this.onChangeSearchTitle.bind(this);
      this.retrieveListings = this.retrieveListings.bind(this);
      this.refreshList = this.refreshList.bind(this);
      this.setActiveListing = this.setActiveListing.bind(this);
      this.removeAlllistings = this.removeAlllistings.bind(this);
      this.searchTitle = this.searchTitle.bind(this);
      this.setPage = this.setPage.bind(this);
  
      this.state = {
        // state variable
        listings: [],
        currentListing: null,
        currentIndex: -1,
        searchTitle: "",
        currentPage: 0,
        totalPages: 0,
      };
    }
  
    componentDidMount() {
      this.retrieveListings(this.state.currentPage);
    }
  
    onChangeSearchTitle(e) {
      const searchTitle = e.target.value;
  
      this.setState({
        searchTitle: searchTitle,
      });
    }
  
    retrieveListings(currentPage) {
      http
        .get("/api/listings?page=" + currentPage+"&size=1")
        .then((response) => {
          //this is the response from web server
          this.setState({
            listings: response.data.listings,
            currentPage: response.data.currentPage,
            totalPages: response.data.totalPages,
          });
          console.log(response.data); //print in console, just for testing
        })
        .catch((e) => {
          console.log(e);
        });
    }
  
    refreshList() {
      this.retrieveListings(this.state.currentPage);
      this.setState({
        currentListing: null,
        currentIndex: -1,
      });
    }
  
    setActiveListing(listing, index) {
      this.setState({
        currentListing: listing,
        currentIndex: index,
      });
    }
  
    removeAlllistings() {
      http
        .delete("/api/listings",)
        .then((response) => {
          console.log(response.data);
          this.refreshList();
        })
        .catch((e) => {
          console.log(e);
        });
    }
  
    searchTitle() {
      http
        .get("/api/listings/" + this.state.searchTitle, {

        })
        .then((response) => {
          this.setState({
            listings: response.data.listings,
          });
          console.log(response.data);
        })
        .catch((e) => {
          console.log(e);
        });
    }
  
    setPage(increment) {
      this.retrieveListings(this.state.currentPage + increment);
      this.setState({ currentPage: this.state.currentPage + increment });
    }
  
    render() {
      const {
        searchTitle,
        listings,
        currentListing,
        currentIndex,
      } = this.state;
  
      return (
        <div className="list row">
          <div className="col-md-8">
            <div className="input-group mb-3">
              <input
                type="text"
                className="form-control"
                placeholder="Search by title"
                value={searchTitle}
                onChange={this.onChangeSearchTitle}
              />
              <div className="input-group-append">
                <button
                  className="btn btn-outline-secondary"
                  type="button"
                  onClick={this.searchTitle}
                >
                  Search
                </button>
                {this.state.currentPage < this.state.totalPages - 1 ? (
                  <button
                    className="btn btn-outline-secondary"
                    type="button"
                    onClick={() => this.setPage(1)}
                  >
                    Next
                    {/* {this.state.currentPage === this.state.totalPages - 1
                    ? "Previous"
                    : "Next"} */}
                  </button>):("") }{this.state.currentPage === 0 ? ("") : (
                  <button
                    className="btn btn-outline-secondary"
                    type="button"
                    onClick={() => this.setPage(-1)}
                  >
                    Previous
                  </button>
                )}
              </div>
            </div>
          </div>
          <div className="col-md-6">
            <h4>listings List</h4>
            <ul className="list-group">
              {listings && listings.map((tutorial, index) => (
                  <li
                  className={"list-group-item" + (index===currentIndex ? "active" : "")}
                    onClick={() => this.setActiveListing(tutorial, index)}
                    key={index}
                  >
                    {tutorial.title}
                   <p> {tutorial.price}</p>
                  </li>
                
                ))}
            </ul>
  
            <button
              className="m-3 btn btn-sm btn-danger"
              onClick={this.removeAlllistings}
            >
              Remove All
            </button>
          </div>
          <div className="col-md-6">
            {currentListing ? (
              <div>
                <h4>Tutorial</h4>
                <div>
                  <label>
                    <strong>Title:</strong>
                  </label>{" "}
                  {currentListing.title}
                </div>
                <div>
                  <label>
                    <strong>Description:</strong>
                  </label>
                  {"    "}
                  {currentListing.description}
                </div>
                <div>
                  <label>
                    <strong>Status:</strong>
                  </label>{" "}
                  {currentListing.published ? "Published" : "Pending"}
                </div>
  
                <Link
                  to={"/getOne/" + currentListing.listing_id}
                  className="badge badge-warning"
                >
                  Edit
                </Link>
              </div>
            ): (
              <div>
                <br />
                <p>Please click on a Tutorial...</p>
              </div>
            ) }
          </div>
        </div>
      );
    }
  }