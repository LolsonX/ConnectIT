import React, {Component} from "react";
import './Sidebar.css'

export class Sidebar extends Component{
    constructor(props) {
        super(props);
        this.props = props;
    }
    render(){
        return <div className="sidebar">
            <ul className="sidebar-nav">
                {this.props.children}
            </ul>
        </div>
    }

}