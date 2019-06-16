//
//  HandlerTypealiases.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 16.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

public typealias VoidHandler = (() -> Void)
public typealias BoolHandler = ((Bool) -> Void)
public typealias ResourcesHandler = ((Resources.GetResources.RequestModel?) -> Void)
public typealias ResourceDetailHandler = ((ResourceDetail.GetResourceDetail.RequestModel?) -> Void)
