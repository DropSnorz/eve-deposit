import React from 'react';
import OreList from '../components/OreList.jsx';
import VisibleOreList from '../containers/VisibleOreList.js';
import Filter from '../containers/Filter.js';


class OreApp extends React.Component {
  render() {
    return 	<div>
    			<h1>Ore</h1>
    			<div className="ore-filters">
    				<Filter mineralList = {this.props.mineralList} oreList={this.props.oreList} />
    			</div>

    			<div>
    				<VisibleOreList oreList={this.props.oreList} />
    			</div>

    		</div>
  }
}

export default OreApp