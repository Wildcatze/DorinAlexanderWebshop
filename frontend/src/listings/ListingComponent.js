import React, { Component } from "react";
import http from "../service/httpservice";

export default class ListingComponent extends Component {
  constructor(props) {
    super(props);
    this.onChangeTitle = this.onChangeTitle.bind(this);
    this.onChangeDescription = this.onChangeDescription.bind(this);
    this.getListing = this.getListing.bind(this);
    this.updateCondition = this.updateCondition.bind(this);
    this.updateListing = this.updateListing.bind(this);
    this.deleteListing = this.deleteListing.bind(this);

    this.state = {
      currentListing: {
        listing_id: null,
        title: "",
        description: "",
        condition: false,
      },
      message: "",
    };
  }

  componentDidMount() {
    this.getListing(this.props.match.params.id);
    console.log(this.props.match.params.id);
  }

  onChangeTitle(e) {
    const title = e.target.value;
    const description = e.target.value;
    this.setState(function (prevState) {
      return {
        currentListing: {
          ...prevState.currentListing,
          title: title,
          description:description
          
        },
      };
    });
  }

  onChangeDescription(e) {
    const description = e.target.value;

    this.setState(function(prevState){ 
        return{
      currentListing: {
        ...prevState.currentListing,
        description: description,
      },
    };
});
  }

  getListing(listing_id) {

    //http.get("/tutorials/" + listing_id, { headers: http.authHeader() });
    http.get("/getOne/" + listing_id)
      .then((response) => {
        this.setState({
          currentListing: response.data,
        });
        console.log(response.data);
      })
      .catch((e) => {
        console.log(e);
      });
  }

  updateCondition(status) {
    var data = {
      listing_id: this.state.currentListing.listing_id,
      title: this.state.currentListing.title,
      description: this.state.currentListing.description,
      condition: status,
    };

    http
      .put("/update/" + this.state.currentListing.listing_id)
      .then((response) => {
        this.setState((prevState) => ({
          currentListing: {
            ...prevState.currentListing,
            condition: status,
          },
        }));
        console.log(response.data);
      })
      .catch((e) => {
        console.log(e);
      });
  }

  updateListing() {
    http
      .put(
        "/update/" + this.state.currentListing.listing_id,
        this.state.currentListing
      )
      .then((response) => {
        console.log(response.data);
        this.setState({
          message: "The tutorial was updated successfully!",
        });
      })
      .catch((e) => {
        console.log(e);
      });
  }

  deleteListing() {
    http
      .delete("/delete/" + this.state.currentListing.listing_id)
      .then((response) => {
        console.log(response.data);
        this.props.history.push("/listings");
      })
      .catch((e) => {
        console.log(e);
      });
  }

  render() {
    const { currentListing } = this.state;

    return (
      <div>
        {currentListing ? (
          <div className="edit-form">
              <h1>{currentListing.listing_id}</h1>
            <h4>Listing</h4>
            <form>
              <div className="form-group">
                <label htmlFor="title">Title</label>
                <input
                  type="text"
                  className="form-control"
                  listing_id="title"
                  value={currentListing.title}
                  onChange={this.onChangeTitle}
                />
              </div>
              <div className="form-group">
                <label htmlFor="description">Description</label>
                <input
                  type="text"
                  className="form-control"
                  listing_id="description"
                  value={currentListing.description}
                  onChange={this.onChangeDescription}
                />
              </div>

              <div className="form-group">
                <label>
                  <strong>Status:</strong>
                </label>
                {currentListing.condition ? "condition" : "Pending"}
              </div>
            </form>

            {currentListing.condition ? (
              <button
                className="badge badge-primary mr-2"
                onClick={() => this.updateCondition(false)}
              >
                UnPublish
              </button>
            ) : (
              <button
                className="badge badge-primary mr-2"
                onClick={() => this.updateCondition(true)}
              >
                Publish
              </button>
            )}

            <button
              className="badge badge-danger mr-2"
              onClick={this.deleteListing}
            >
              Delete
            </button>

            <button
              type="submit"
              className="badge badge-success"
              onClick={this.updateListing}
            >
              Update
            </button>
            <p>{this.state.message}</p>
          </div>
        ) : (
          <div>
            <br />
            <p>Please click on a Tutorial...</p>
          </div>
        )}
      </div>
    );
  }
}