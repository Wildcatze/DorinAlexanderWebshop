import React, { Component } from "react";
//import ListingDataService from "../../services/listing.service";
import http from "../../services/httpService";

export default class Listing extends Component {
    constructor(props) {
        super(props);
        this.onChangeTitle = this.onChangeTitle.bind(this);
        this.onChangeDescription = this.onChangeDescription.bind(this);
        this.getListing = this.getListing.bind(this);
        this.updatePublished = this.updatePublished.bind(this);
        this.updateListing = this.updateListing.bind(this);
        this.deleteListing = this.deleteListing.bind(this);

        this.state = {
            currentListing: {
                id: null,
                title: "",
                description: "",
                published: false,
            },
            message: "",
        };
    }

    componentDidMount() {
        this.getlisting(this.props.match.params.id);
    }

    onChangeTitle(e) {
        const title = e.target.value;

        this.setState(function (prevState) {
            return {
                currentlisting: {
                    ...prevState.currentlisting,
                    title: title,
                },
            };
        });
    }

    onChangeDescription(e) {
        const description = e.target.value;

        this.setState((prevState) => ({
            currentlisting: {
                ...prevState.currentlisting,
                description: description,
            },
        }));
    }

    getlisting(id) {
        //http.get("/listings/" + id, { headers: http.authHeader() });
        http
            .get("/listings/" + id, { headers: http.authHeader() })
            .then((response) => {
                this.setState({
                    currentlisting: response.data,
                });
                console.log(response.data);
            })
            .catch((e) => {
                console.log(e);
            });
    }

    updatePublished(status) {
        var data = {
            id: this.state.currentListing.id,
            title: this.state.currentListing.title,
            description: this.state.currentListing.description,
            published: status,
        };

        http
            .put("/listings/" + this.state.currentListing.id, data, {
                headers: http.authHeader(),
            })
            .then((response) => {
                this.setState((prevState) => ({
                    currentListing: {
                        ...prevState.currentListing,
                        published: status,
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
                "/listings/" + this.state.currentListing.id,
                this.state.currentListing,
                { headers: http.authHeader() }
            )
            .then((response) => {
                console.log(response.data);
                this.setState({
                    message: "The Listing was updated successfully!",
                });
            })
            .catch((e) => {
                console.log(e);
            });
    }

    deleteListing() {
        http
            .delete("/Listings/" + this.state.currentListing.id, {
                headers: http.authHeader(),
            })
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
                        <h4>Listing</h4>
                        <form>
                            <div className="form-group">
                                <label htmlFor="title">Title</label>
                                <input
                                    type="text"
                                    className="form-control"
                                    id="title"
                                    value={currentListing.title}
                                    onChange={this.onChangeTitle}
                                />
                            </div>
                            <div className="form-group">
                                <label htmlFor="description">Description</label>
                                <input
                                    type="text"
                                    className="form-control"
                                    id="description"
                                    value={currentListing.description}
                                    onChange={this.onChangeDescription}
                                />
                            </div>

                            <div className="form-group">
                                <label>
                                    <strong>Status:</strong>
                                </label>
                                {currentListing.published ? "Published" : "Pending"}
                            </div>
                        </form>

                        {currentListing.published ? (
                            <button
                                className="badge badge-primary mr-2"
                                onClick={() => this.updatePublished(false)}
                            >
                                UnPublish
                            </button>
                        ) : (
                            <button
                                className="badge badge-primary mr-2"
                                onClick={() => this.updatePublished(true)}
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
                        <p>Please click on a Listing...</p>
                    </div>
                )}
            </div>
        );
    }
}
