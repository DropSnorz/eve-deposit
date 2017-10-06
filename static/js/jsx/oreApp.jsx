import React from 'react';
import ReactDOM from 'react-dom';
import OreFilter from './oreFilter.jsx';
import OreList from './oreList.jsx';


class OreApp extends React.Component {
  render() {
    return 	<div>
    			<h1>Ore</h1>
    			<div className="ore-filters">
    				<OreFilter mineralList = {this.props.mineralList} oreList={this.props.oreList} />
    			</div>

    			<div>
    				<OreList oreList={this.props.oreList} />
    			</div>

    		</div>
  }
}

ReactDOM.render(<OreApp mineralList = {minerals} oreList = {primaryOres} />, document.getElementById('ore-component'));