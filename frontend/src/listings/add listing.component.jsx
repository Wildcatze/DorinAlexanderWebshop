import React, { Component } from "react";
//import ListingDataService from "../../services/listing.service";
import http from "../service/httpservice";

export default class AddListing extends Component {
    constructor(props) {
        super(props);
        this.onChangeTitle = this.onChangeTitle.bind(this);
        this.onChangeDescription = this.onChangeDescription.bind(this);
        this.onChangeCondition=this.onChangeCondition.bind(this);
        this.onChangeContactInfo=this.onChangeContactInfo.bind(this);
        this.onChangePrice=this.onChangePrice.bind(this);
        this.saveListing = this.saveListing.bind(this);
        this.newListing = this.newListing.bind(this);
    
        this.state = {
            id: null,
            title: "",
            description: "",
            date:"2020-04-24",
            price: 0,
            item_condition: "",
            contactinfo:"",
            type_id:1,
            account_id:2,
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
    onChangePrice(e){
        this.setState({
            price:e.target.value,
        });
    }
    onChangeCondition(e){
        this.setState({
            item_condition: e.target.value,
        })
    }
    onChangeContactInfo(e){
        this.setState(
            {
                contactinfo: e.target.value,
            }
        )
    }

    saveListing() {
        var data = {
            title: this.state.title,
            description: this.state.description,
            date:this.state.date,
            price: this.state.price,
            item_condition: this.state.condition,
            contactinfo: this.state.contactinfo,
            type_id:this.state.type_id,
            account_id:this.state.account_id
        };

        http
            .post("/create", data) // http POST request
            .then((response) => {
                this.setState({
                    id: response.data.id,
                    title: response.data.title,
                    description: response.data.description,
                    date:response.data.date,
                    price: response.data.price,
                    item_condition: response.data.condition,
                    contactinfo: response.data.contactinfo,
                    type_id:response.data.type_id,
                    account_id:response.data.account_id
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
            price: 0,
            item_condition: "",
            contactinfo:"",
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
                        <div className="form-group">
                            <label htmlFor="description">Condition</label>
                            <input
                                type="text"
                                className="form-control"
                                id="item_condition"
                                required
                                value={this.state.condition}
                                onChange={this.onChangeCondition}
                                name="item_condition"
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="description">Price</label>
                            <input
                                type="number"
                                className="form-control"
                                id="price"
                                required
                                value={this.state.price}
                                onChange={this.onChangePrice}
                                name="price"
                            />
                        </div>
                          <div className="form-group">
                            <label htmlFor="description">Contact Information</label>
                            <input
                                type="text"
                                className="form-control"
                                id="contactinfo"
                                required
                                value={this.state.contactinfo}
                                onChange={this.onChangeContactInfo}
                                name="contactinfo"
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
