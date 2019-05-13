import React, { Component } from 'react';
import axios from 'axios';

/////// 커리어를 멤버 정보에 합쳐서 사용되지 않을 듯??
class ProfileCareer extends Component {
  constructor(props) {
    super(props);
    
    this.state = { value: 'select', posi:''};
  }

  onChange(e) {
    this.setState({
      value: e.target.value
    })
  }
  handleChangeInput = (e, target) => {
    //인풋 값 변경
    console.log(e.target.value)
    this.setState({ [target]: e.target.value });
}
  
  changeCareerAPI(){
    const careerInfo={
      dept: this.state.value,
      posi: this.state.posi
    }
    console.log("보낸다 가라아아앗",this.props.selectUser)
    console.log("보낸다 가라아아앗2",careerInfo)

    return axios.post('http://localhost:8080/upmureport/api/career/modify',
    {
      mem:this.props.selectUser,
      newCar:careerInfo
    }
    )
  }

  

  render() {
    let currentCarrer;
    let pastCareer = [];
    console.log("멤버쪽", this.props.selectUser)
    const selectUser1 = this.props.selectUser
    console.log("체크해", selectUser1.career)
    const careers = selectUser1.career
    // 있으면 //
    if (careers) {
      careers.forEach(car => {
        if (car.active === true) {
          console.log("현재 커리어", car)
          currentCarrer = car;
        }
        else {
          pastCareer.concat = car;
        }
      })
    }
    console.log("asdsadada",this.props.selectUser)

    return (

      <div class="card  h-100" align="">

        {/* <nav className="navbar navbar-expand navbar-light bg-light mb-4">
          <a className="navbar-brand" href="/">커리어</a>
          <ul className="navbar-nav ml-auto">
            <li className="nav-item dropdown">
              <a className="nav-link dropdown-toggle" href="/" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown
                        </a>
              <div className="dropdown-menu dropdown-menu-right animated--fade-in" aria-labelledby="navbarDropdown">
                <a className="dropdown-item" href="/">Action</a>
                <a className="dropdown-item" href="/">Another action</a>
                <div className="dropdown-divider"></div>
                <a className="dropdown-item" href="/">Something else here</a>
              </div>
            </li>
          </ul>
        </nav> */}
        {/* <nav className="navbar navbar-expand navbar-light bg-light mb-1"> 
          <div className="navbar-brand" align="middle">Career</div>
        </nav> */}
        <div className="card-header font-weight-bold text-black" >현재 커리어</div>
        <div className="card-body">
          <div className="row no-gutters align-items-center">
            <div className="col mr-2">
              <div className="text-xs font-weight-bold text-primary text-uppercase mb-1">시작일</div>
              <div className="h5 mb-0 font-weight-bold text-gray-800">{currentCarrer && currentCarrer.startDate}</div>
            </div>
        
          </div>
        </div>

        <div className="card-body">
          <div className="row no-gutters align-items-center">
            <div className="col mr-2">
              <div className="text-xs font-weight-bold text-primary text-uppercase mb-1">부서</div>
              <div className="h5 mb-0 font-weight-bold text-gray-800"> {currentCarrer && currentCarrer.dept}</div>

            </div>
            
          </div>
        </div>

        <div className="card-body">
          <div className="row no-gutters align-items-center">
            <div className="col mr-2">
              <div className="text-xs font-weight-bold text-primary text-uppercase mb-1">직책</div>
              <div className="h5 mb-0 font-weight-bold text-gray-800"> {currentCarrer && currentCarrer.posi}</div>
             
            </div>
            
          </div>
        </div>

        {/* <input type="button" value=" Change " name="dept" onClick={this.changeCareerAPI.bind(this)} class="btn btn-success btn-icon-split"></input> */}
      </div>

    );
  }
}

export default ProfileCareer;