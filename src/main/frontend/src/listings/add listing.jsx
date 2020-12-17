import React, { Component } from "react";
//import ListingDataService from "../../services/listing.service";
import http from "../../services/httpService";

export default class AddListing extends Component {
    constructor(props) {
        super(props);
        this.onChangeTitle = this.onChangeTitle.bind(this);
        this.onChangeDescription = this.onChangeDescription.bind(this);
        this.saveListing = this.saveListing.bind(this);
        this.newListing = this.newListing.bind(this);

        this.state = {
            id: null,
            title: "",
            description: "",
            published: false,

            submitted: false,
        };
    }

    onChangeTitle(e) {
        this.setState({
            title: e.target.value,
        });
    }

    onChangeDescription(e) {
        this.setState({
            description: e.target.value,
        });
    }

    saveListing() {
        var data = {
            title: this.state.title,
            description: this.state.description,
        };

        http
            .post("/listings", data, { headers: http.authHeader() }) // http POST request
            .then((response) => {
                this.setState({
                    id: response.data.id,
                    title: response.data.title,
                    description: response.data.description,
                    published: response.data.published,

                    submitted: true,
                });
                console.log(response.data);
            })
            .catch((e) => {
                console.log(e);
            });
    }

    newListing() {
        this.setState({
            id: null,
            title: "",
            description: "",
            published: false,

            submitted: false,
        });
    }

    render() {
        return (
            <div className="submit-form">
                {this.state.submitted ? (
                    <div>
                        <h4>You submitted successfully!</h4>
                        <button className="btn btn-success" onClick={this.newListing}>
                            Add
                        </button>
                    </div>
                ) : (
                    <div>
                        <div className="form-group">
                            <label htmlFor="title">Title</label>
                            <input
                                type="text"
                                className="form-control"
                                id="title"
                                required
                                value={this.state.title}
                                onChange={this.onChangeTitle}
                                name="title"
                            />
                        </div>

                        <div className="form-group">
                            <label htmlFor="description">Description</label>
                            <input
                                type="text"
                                className="form-control"
                                id="description"
                                required
                                value={this.state.description}
                                onChange={this.onChangeDescription}
                                name="description"
                            />
                        </div>

                        <button onClick={this.saveListing} className="btn btn-success">
                            Submit
                        </button>
                    </div>
                )}
            </div>
        );
    }
}
