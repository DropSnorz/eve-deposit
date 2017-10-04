import React from 'react';
import ReactDOM from 'react-dom';
import OreFilter from './oreFilter.jsx';
import OreList from './oreList.jsx';


class OreApp extends React.Component {
  render() {
    return 	<div>
    			<h1>Ore App</h1>
    			<div className="ore-filters">
    				<OreFilter mineralList = {this.props.mineralList} />
    			</div>

    			<div>
    				<OreList oreList={this.props.oreList} />
    			</div>

    			<p>Hello !</p>
    		</div>
  }
}

var mineralList = [{name:"Tritanium"}, {name:"Mexallon"}];
var oreList = [{name:"Veldspar", price:"1"}, {name:"Scordite", price:"2"}];
ReactDOM.render(<OreApp mineralList = {mineralList} oreList = {oreList} />, document.getElementById('ore-component'));