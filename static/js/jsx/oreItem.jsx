import React from 'react';
import ReactDOM from 'react-dom';

export default class OreItem extends React.Component {
	constructor(props) {
    	super(props);
    	this.state = {selected: false};
  }
  render() {
  	var name = this.props.name;
  	var price = this.props.price;
    return 	<div>
    			{name} : {price}
    		</div>
  }
}

