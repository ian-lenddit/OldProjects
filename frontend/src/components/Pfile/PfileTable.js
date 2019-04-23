import React, { Component } from 'react';
import { Map, List } from 'immutable';
import UpdatePfileModal from './UpdatePfileModal';
import AttachmentItem from './AttachmentItem' ;
import PfileItem from './PfileItem';

class PfileTable extends React.Component {
    constructor(props) {
        super(props);
        
        this.state = {
            dirs: List(),
            attachments: List(),
            updateModal: false,
            pfile: {},
            attahment : {},
        };
    }

    onClickPfile = (pfile) => {
        console.log(pfile);
        const {handleClickPfile} = this.props;
        this.setState({ pfile: pfile })
        handleClickPfile(pfile);
    }

    onClickPfileDelete = (pfileId) => {        
        const {handleDeletePfile} = this.props;
        handleDeletePfile(pfileId);
    }

    onClickAttachment = (attahment) => {
        const {handleClickAttachment} = this.props;

        this.setState({ attahment: attahment })
        handleClickAttachment(attahment);
    }

    render() {
        const {pfiles, attachments, selectedDirId} = this.props;
        console.log('selectedDirId---', selectedDirId);
        return (
            <div overflow-x = "auto">
                <h2>{selectedDirId}</h2>
                <div className="container" id="PfileTable" cellSpacing="0" width="100%">
                    <div class="row">
                        
                            <div class="col-8">제목</div>
                            <div class="col-2">유형</div>
                            <div class="col-1">상세정보</div>
                            <div class="col-1">삭제</div>
                    </div>
                    <div>
                        
                        {pfiles && pfiles.map((pfile, idx) => {
                            return(  
                            <PfileItem
                                idx = {idx}
                                pfile = {pfile}
                                onClickPfile = {this.onClickPfile}
                                onClickPfileDelete = {this.onClickPfileDelete}
                                />
                            )
                        })}

                        {attachments && attachments.map((attachment, idx) => {
                            return(
                            <AttachmentItem 
                                idx = {idx}
                                attachment = {attachment}
                                onClickAttachment = {this.onClickAttachment}
                            />
                            )
                        })}     
                    </div>
                </div>
            </div>
        )
    }
}

export default PfileTable;