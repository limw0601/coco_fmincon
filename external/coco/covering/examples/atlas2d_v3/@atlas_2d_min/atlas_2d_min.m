classdef atlas_2d_min < AtlasBase
  %ATLAS_2D_MIN   2d atlas algorithm
  % 
  % This subclass to AtlasBase implements a 2-dimensional point-cloud atlas
  % algorithm with constant step size and theta-based projection condition
  % and predictor. The atlas stores a chart network to prevent redundant
  % coverage and implements a recursive merger. This algorithm may
  % terminate prematurely.
  
  % Copyright (C) Frank Schilder, Harry Dankowicz
  % $Id: atlas_2d_min.m 3120 2019-06-11 02:25:07Z hdankowicz $
  
  properties (Access=private)
    boundary = [];       % Integer array to hold ids of boundary charts
    charts   = {};       % Cell array to hold atlas charts
    next_pt  = 0;        % Chart counter
    cont     = struct(); % Struct used to hold class settings
  end
  
  methods (Access=private)
    function atlas = atlas_2d_min(prob, cont, dim)
      %ATLAS_2D_MIN   Class constructor.
      %
      % Verify that the continuation problem is initializable with
      % a 2-dimensional atlas algorithm, call the superclass
      % constructor to instantiate an object, and append the cont
      % property with default class settings.

      assert(dim==2, '%s: wrong manifold dimension', mfilename);
      atlas      = atlas@AtlasBase(prob);
      atlas.cont = atlas.get_settings(cont);
    end
  end
  
  methods (Static)
    function [prob, cont, atlas] = create(prob, cont, dim)
      %CREATE   Static construction method.
      %
      % Create an instance of the class object using the class
      % constructor, store class settings in the cont variable, and
      % allocate an empty projection condition.
      
      atlas = atlas_2d_min(prob, cont, dim);
      prob  = CurveSegment.add_prcond(prob, dim);
    end
  end
  
  methods (Static, Access=private)
    cont = get_settings(cont)
  end
  
  methods (Access=public) % interface methods
    [prob, atlas, cseg, correct] = init_prcond(atlas, prob, chart) % Initialize projection condition
    [prob, atlas, cseg, flush]   = init_atlas (atlas, prob, cseg)  % Initialize atlas
    [prob, atlas, cseg]          = flush      (atlas, prob, cseg)  % Flush point list
    [prob, atlas, cseg, correct] = predict    (atlas, prob, cseg)  % Compute predictor
    [prob, atlas, cseg, flush]   = add_chart  (atlas, prob, cseg)  % Add chart to point list
  end
  
  methods (Access=private)
    flag = isneighbor(atlas, chart1, chart2)
    [atlas, cseg] = merge(atlas, cseg)
    [atlas, chart1, checked] = merge_recursive(atlas, chart1, k, checked)
  end
  
end
